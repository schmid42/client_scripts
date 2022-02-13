import subprocess
from util.logger import ServerLogger
from util.logger import State

server_logger = ServerLogger()

choco = subprocess.Popen([ "choco"], stdout=subprocess.PIPE, stderr=subprocess.STDOUT)

out = choco.communicate()[0]

out_log = out.decode(encoding='utf-8')

r = server_logger.log(State.INFO, out_log)
