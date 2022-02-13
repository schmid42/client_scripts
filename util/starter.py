from enum import Enum
from dotenv import load_dotenv
import getpass
import subprocess
from tkinter import *
import os

load_dotenv()  # take environment variables from .env.

class Software(Enum):
    MINETEST = "MINETEST"

class Minetest:
    def __init__(self):
        self.username = os.getenv('MINETEST_USERNAME')
        self.password = os.getenv('MINETEST_PASSWORD')
        self.server   = os.getenv('MINETEST_SERVER')
        self.port     = os.getenv('MINETEST_PORT')
        self.program  = os.path.join(os.getenv('PROGRAMFILES'), "minetest", "bin", "minetest.exe")

    def launch(self):
        subprocess.run([self.program, "--go", "--name", self.username, "--password", self.password, "--address", self.server, "--port", str(self.port)])

class Starter:

    def __init__(self):
        self.system_username   = getpass.getuser()
 
    def start(self, software):
        if software == Software.MINETEST:
            minetest = Minetest()
            minetest.launch()
