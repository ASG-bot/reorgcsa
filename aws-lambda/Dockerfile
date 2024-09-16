FROM public.ecr.aws/lambda/python:3.12

# Copy the function code into the container
COPY handler.py ${LAMBDA_TASK_ROOT}

CMD ["handler.handler"]
