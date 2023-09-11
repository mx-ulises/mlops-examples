FROM ludwigai/ludwig:master

WORKDIR /model

COPY model .

ENTRYPOINT ["ludwig", "serve", "--model_path=/model"]
