from flask import request, render_template, jsonify
import flask

books = [{
    'name':'hello',
    'Rollno': 1,
    'country':'Nepal',
    'company':'hello company'},
{
    'name':'hello2',
    'Rollno': 2,
    'country':'Nepal',
    'company':'hello company2'},
{
    'name':'hello3',
    'Rollno': 3,
    'country':'Nepal',
    'company':'hello company3'},
{
    'name':'hello4',
    'Rollno': 4,
    'country':'Nepal',
    'company':'hello company4'},
{
    'name':'hello5',
    'Rollno': 5,
    'country':'Nepal',
    'company':'hello company5'},
{
    'name':'hello6',
    'Rollno': 6,
    'country':'Nepal',
    'company':'hello company6'}
    ]

app = flask.Flask(__name__,template_folder='templates')
app.config['DEBUG'] = True


@app.route('/', methods = ['GET'])
def home():
    return 'Hello'

@app.route('/home/books', methods = ['GET'])
def api_all():
    return jsonify(books)

@app.route('/books', methods = ['GET'])
def api_id():
    if 'Rollno' in request.args:
        id = int(request.args['Rollno'])
    else:
        return '<h1>Wrong ID.</h1>'
    res = []
    for book in books:
        if id == book['Rollno']:
            res.append(book)
    return jsonify(res)


app.run()

