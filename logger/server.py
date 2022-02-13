from util.logger import ServerLogger
from util.logger import State

server_logger = ServerLogger()
r = server_logger.log(State.INFO, 'A Test Message')
