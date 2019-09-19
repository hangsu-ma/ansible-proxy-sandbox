class FilterModule(object):
    def filters(self):
        return {
            'hello': hello_world
        }


def hello_world(before_pipe, param ):
    return "hello world"