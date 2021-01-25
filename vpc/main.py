#!/usr/bin/env python
from constructs import Construct
from cdktf import App, TerraformStack


class MyStack(TerraformStack):
    def __init__(self, scope: Construct, ns: str):
        super().__init__(scope, ns)

        # define resources here


app = App()
stack = MyStack(app, "vpc")
stack.add_override('terraform.backend', {
  'remote': {
    'hostname': 'app.terraform.io',
    'organization': 'cdktf-kafka',
    'workspaces': {
      'name': 'python-pip'
    }
  }
})

app.synth()
