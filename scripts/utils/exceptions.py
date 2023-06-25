class EmptyError(Exception):

    def __init__(self, msg="El string ingresado es vacío"):
        self.msg = msg
        super().__init__(self.msg)

class MediaNameError(Exception):

    def __init__(self, msg="El nombre del medio de prensa ya está ingresado en la base de datos"):
        self.msg = msg
        super().__init__(self.msg)

class MediaURLError(Exception):

    def __init__(self, msg="El sitio web del medio de prensa ya está ingresado en la base de datos"):
        self.msg = msg
        super().__init__(self.msg)