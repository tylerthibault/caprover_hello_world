from flask import Flask
from hello_world.controllers.routes import main

app = Flask(__name__)

app.register_blueprint(main)
