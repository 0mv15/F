from bot import CMD_INDEX


class _BotCommands:
    def __init__(self):
        self.StartCommand = f'start{CMD_INDEX}'
        self.MirrorCommand = f'mirror{CMD_INDEX}'
        self.ListCommand = f'list{CMD_INDEX}'
        self.EvalCommand = 'eval'
        self.ExecCommand = 'exec'
        self.ClearLocalsCommand = 'clearlocals'
        self.ExecHelpCommand = 'exechelp'   
        self.AuthorizedUsersCommand = f'users{CMD_INDEX}'
        self.AuthorizeCommand = f'authorize{CMD_INDEX}'
        self.UnAuthorizeCommand = f'unauthorize{CMD_INDEX}'
        self.AddSudoCommand = f'addsudo{CMD_INDEX}'
        self.RmSudoCommand = f'rmsudo{CMD_INDEX}'
        self.PingCommand = f'ping{CMD_INDEX}'
        self.RestartCommand = f'restart{CMD_INDEX}'
        self.StatsCommand = f'stats{CMD_INDEX}'
        self.HelpCommand = f'help{CMD_INDEX}'
        self.LogCommand = f'log{CMD_INDEX}'
        self.CloneCommand = f'clone{CMD_INDEX}'
        self.CountCommand = f'count{CMD_INDEX}'
        self.WatchCommand = f'watch{CMD_INDEX}'
        self.DeleteCommand = f'del{CMD_INDEX}'
        self.ShellCommand = f'sh{CMD_INDEX}'
 

BotCommands = _BotCommands()
