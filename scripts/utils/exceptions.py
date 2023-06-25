class EmptyError(Exception):

    def __init__(self, msg="El string ingresado está vacío"):
        self.msg = msg
        super().__init__(self.msg)

class MediaError(Exception):

    def __init__(self, msg="El nombre y la url del medio de prensa ya están ingresados en la base de datos"):
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

class CoberturasError(Exception):

    def __init__(self, msg="Los datos ingresados para las coberturas no son válidos"):
        self.msg = msg
        super().__init__(self.msg)