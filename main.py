import json
# from flaskext.markdown import Markdown
# from wtf_tinymce import wtf_tinymce

# import markdown
# import markdown.extensions.fenced_code
# import markdown.extensions.codehilite
# from pygments.formatters import HtmlFormatter


from flask import Flask, render_template, request, session, redirect,flash
from flask_sqlalchemy import SQLAlchemy
from werkzeug.utils import secure_filename
from flask_mail import Mail
from datetime import datetime
import os
import math

# from flask_ckeditor import CKEditor


with open('C:/Users/user/PycharmProjects/pythonProject2/config.json', 'r') as c:
    params = json.load(c)["params"]

local_server = True

app = Flask(__name__)
app.secret_key = params["secret-key"]

app.config['UPLOAD_FOLDER'] = params['uploader_location']
app.config.update(
    MAIL_SERVER='smtp.gmail.com',
    MAIL_POST=587,
    MAIL_USE_TLS=True,
    MAIL_USERNAME=params["gmail_user"],
    MAIL_PASSWORD=params["gmail_password"]
)

mail = Mail(app)
# ckeditor = CKEditor(app)

# wtf_tinymce.init_app(app)

if local_server:
    app.config['SQLALCHEMY_DATABASE_URI'] = params["local_uri"]
else:
    app.config['SQLALCHEMY_DATABASE_URI'] = params["local_uri"]
db: SQLAlchemy = SQLAlchemy(app)


class Contacts(db.Model):
    '''
      s.no name phone_num msg date email
    '''
    sno = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(80), unique=False, nullable=False)
    phone_num = db.Column(db.String(12), nullable=False)
    msg = db.Column(db.String(120), nullable=False)
    date = db.Column(db.String(12), nullable=True)
    email = db.Column(db.String(120), nullable=False)


class Posts(db.Model):
    '''
      s.no name phone_num msg date email
    '''
    __tablename__ = "posts"
    sno = db.Column(db.Integer, primary_key=True)
    title = db.Column(db.String(80), unique=False, nullable=False)
    slug = db.Column(db.String(21), nullable=False)
    author = db.Column(db.String(120), nullable=False)
    category = db.Column(db.String(120),nullable=False)
    content = db.Column(db.String(120), nullable=False)
    tagline = db.Column(db.String(120), nullable=False)
    date = db.Column(db.String(12), nullable=True)
    img_file = db.Column(db.String(12), nullable=True)


class Comments(db.Model):
    __tablename__= "comments"
    s_no = db.Column(db.Integer, primary_key=True)
    body = db.Column(db.String(120), nullable=False)
    date = db.Column(db.String(12), nullable=True)
    post_sno = db.Column(db.Integer, db.ForeignKey('posts.sno'), nullable=False)
    author = db.Column(db.String(150), nullable=False)
    post_article = db.relationship('Posts', backref='post_article', lazy=True)

    def level(self):
        return len(self.path)


class Reply_comments(db.Model):
    s_no_s = db.Column(db.Integer, primary_key=True)
    body = db.Column(db.String(120), nullable=False)
    date = db.Column(db.String(12), nullable=True)
    path = db.Column(db.Text, index=True)
    parent_id = db.Column(db.Integer, db.ForeignKey('comments.s_no'))
    r_author = db.Column(db.String(150), nullable=False)
    replies = db.relationship(
        'Comments', backref=db.backref('parent', remote_side=[parent_id]),
        lazy='dynamic',uselist=True)



@app.route("/")
def home():
    posts = Posts.query.filter_by().all()
    last = math.ceil(len(posts) / int(params['no_of_posts']))
    #  [0:params['no_of_posts']]
    posts = posts[::-1]
    page = request.args.get('page')
    if (not str(page).isnumeric()):
        page = 1

    page = int(page)
    posts = posts[(page - 1) * int(params['no_of_posts']):(page - 1) * int(params['no_of_posts']) + int(
        params['no_of_posts'])]

    if (page == 1):
        prev = "#"
        next = "/?page=" + str(page + 1)
    elif (page == last):
        next = "#"
        prev = "/?page=" + str(page - 1)
    else:
        prev = "/?page=" + str(page - 1)
        next = "/?page=" + str(page + 1)
    return render_template('index.html', params=params, posts=posts, prev=prev, next=next)

@app.route("/categories/<string:category>",methods=['GET','POST'])
def categories(category):
    posts = Posts.query.filter_by(category=category).all()
    print(len(posts))
    '''last = math.ceil(len(posts) / int(params['no_of_posts']))
    #  [0:params['no_of_posts']]
    posts = posts[::-1]
    cpage = request.args.get('cpage')
    if (not str(cpage).isnumeric()):
        cpage = 1

    cpage = int(cpage)
    posts = posts[(cpage - 1) * int(params['no_of_posts']):(cpage - 1) * int(params['no_of_posts']) + int(
        params['no_of_posts'])]

    if (cpage == 1):
        prevs = "#0"
        nexts = "/?cpage=" + str(cpage + 1)
    elif (cpage == last):
        nexts = "#0"
        prevs = "/?cpage=" + str(cpage - 1)
    else:
        prevs = "/?cpage=" + str(cpage - 1)
        nexts = "/?cpage=" + str(cpage + 1)'''
    return render_template('categories.html', params=params, posts=posts,category=category)


@app.route("/dashboard", methods=['GET', 'POST'])
def dashboard():
    if 'user' in session and session['user'] == params['admin_user']:
        posts = Posts.query.all()
        return render_template('dashboard.html', params=params, posts=posts)

    if request.method == 'POST':
        username = request.form.get('uname')
        password = request.form.get('pass')
        if (username == params['admin_user'] and password == params['admin_password']):
            # set the session variable
            session['user'] = username
            posts = Posts.query.all()
            flash("You have been succesfully logged in !",'success')
            return render_template('dashboard.html', params=params, posts=posts)
        else:
            flash('Invalid password or username provided', 'danger')
            return render_template('login.html', params=params)
    return render_template('login.html', params=params)

@app.route("/post/<string:post_slug>", methods=['GET', 'POST'])
def post_route(post_slug):
    post = Posts.query.filter_by(slug=post_slug).first()
    comments = Comments.query.filter_by(post_sno=post.sno).all()
    comment = Comments.query.filter_by(post_sno=post.sno).first()
    comments = comments[::-1]
    replies = {}
    for comment in comments:
        replies[comment.s_no] = Reply_comments.query.filter_by(parent_id=comment.s_no).all()
    n = len(comments)
    if request.method == 'POST':
        parent_id = request.form.get('parent_id')
        if parent_id == "":
            body = request.form.get('body')
            author = request.form.get('author')
            entry = Comments(body=body, date=datetime.now(), post_sno=post.sno,author=author)
            db.session.add(entry)
            db.session.commit()
            flash("Your comment has been successfully posted !",'success')
            return redirect(request.url)
        else:
            body = request.form.get('body')
            r_author = request.form.get('r_author')
            entry = Reply_comments(body=body, date=datetime.now(), parent_id=parent_id,r_author=r_author)
            db.session.add(entry)
            db.session.commit()
            return redirect(request.url)
    return render_template('post.html', params=params, post=post, comments=comments, n=n,replies=replies)


@app.route("/about")
def about():
    return render_template('about.html', params=params)


@app.route("/edit/<string:sno>", methods=['GET', 'POST'])
def edit(sno):
    if 'user' in session and session['user'] == params['admin_user']:
        if (request.method == 'POST'):
            box_title = request.form.get('title')
            tline = request.form.get('tline')
            slug = request.form.get('slug')
            content = request.form.get('content')
            img_file = request.form.get('img_file')
            author = request.form.get('author')
            category = request.form.get('category')

            if sno == '0':
                post = Posts(title=box_title, slug=slug , author=author , category=category  , content=content, tagline=tline, date=datetime.now(),
                             img_file=img_file)
                db.session.add(post)
                flash("Post has been succesfully posted !",'success')
                db.session.commit()
            else:
                post = Posts.query.filter_by(sno=sno).first()
                post.title = box_title
                post.slug = slug
                post.tagline = tline
                post.author = author
                post.category = category
                post.content = content
                post.img_file = img_file
                date = datetime.now()
                db.session.commit()
                flash("Post has been successfully edited !",'success')
                return redirect('/edit/' + sno)
        post = Posts.query.filter_by(sno=sno).first()
        return render_template('edit.html', params=params, post=post, sno=sno)


@app.route("/uploader", methods=['GET', 'POST'])
def uploader():
    if 'user' in session and session['user'] == params['admin_user']:
        if (request.method == 'POST'):
            f = request.files['file1']
            f.save(os.path.join(app.config['UPLOAD_FOLDER'], secure_filename(f.filename)))
            flash( "Uploaded successfully")


@app.route("/logout")
def logout():
    session.pop('user')
    return redirect('/dashboard')


@app.route("/delete/<string:sno>", methods=['GET', 'POST'])
def delete(sno):
    if 'user' in session and session['user'] == params['admin_user']:
        post = Posts.query.filter_by(sno=sno).first()
        db.session.delete(post)
        db.session.commit()
    return redirect('/dashboard')


@app.route("/contact", methods=['GET', 'POST'])
def contact():
    if (request.method == 'POST'):
        ''' Add entry to the datbase'''
        name = request.form.get('name')
        email = request.form.get('email')
        phone = request.form.get('phone')
        message = request.form.get('message')

        entry = Contacts(name=name, phone_num=phone, msg=message, date=datetime.now(), email=email)
        db.session.add(entry)
        db.session.commit()
        mail.send_message('New message from ' + name,
                          sender=email,
                          recipients=[params['gmail_user']],
                          body=message + "\n" + phone
                          )
        flash("Your message has been successfully send .",'success')

    return render_template('contact.html', params=params)


app.run(debug=True)
