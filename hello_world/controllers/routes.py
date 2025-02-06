from flask import Blueprint, render_template

# Create a Blueprint named 'main'
main = Blueprint('main', __name__)

# Define routes using the Blueprint
@main.route('/')
def index():
    return 'Hello, World!'

@main.route('/about')
def about():
    return 'About Page'

# You can add more routes here as needed