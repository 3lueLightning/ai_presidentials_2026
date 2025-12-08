import aws_cdk as core
from aws_cdk import assertions

from src.infra.graph_rag_demo_stack import GraphRagDemoStack


# example tests. To run these tests, uncomment this file along with the example
# resource in graph_rag_demo/graph_rag_demo_stack.py
def test_sqs_queue_created():
    app = core.App()
    stack = GraphRagDemoStack(app, "graph-rag-demo")
    _template = assertions.Template.from_stack(stack)  # type: ignore[attr-defined]


#     _template.has_resource_properties("AWS::SQS::Queue", {
#         "VisibilityTimeout": 300
#     })
