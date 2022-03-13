from enum import Enum
from dotenv import load_dotenv
import os
from datetime import datetime
import requests
import socket
import json

load_dotenv()  # take environment variables from .env.


class State(Enum):
    DEBUG = "DEBUG"
    INFO = "INFO"
    SUCCESS = "SUCCESS"
    WARNING = "WARNING"
    ERROR = "ERROR"
    CRITICAL = "CRITICAL"


class ServerLogger:

    def __init__(self):
        '''
        Creates a new Logger object. Loads environment
        variables from .env file.
        '''
        self.host = os.getenv('HOST')
        self.port = os.getenv('PORT')
        self.token = os.getenv('TOKEN')

        self.url_root = 'http://' + self.host + ':' + self.port
        self.url_auth = self.url_root + '/auth/local'
        self.url_log = self.url_root + '/api/logs'

        self.computername = socket.gethostname()

    def log(self, state, message):
        '''
        Posts a log message to the server.
        '''
        headers = {
            'Authorization': 'bearer ' + self.token
        }

        data = {
            'data': {
                'state': state.value,
                'message': message,
                'computername': self.computername,
                'date': datetime.today().isoformat()
            }
        }

        print(data)

        r = requests.post(self.url_log, json=data, headers=headers)

        return r

    def __str__(self):
        return str(self.__class__) + ": " + str(self.__dict__)


class FileLogger:
    pass
