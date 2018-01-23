FROM continuumio/anaconda3:4.4.0

RUN apt-get update

# uWSGI install
RUN apt-get install -y build-essential python3-dev apt-utils
RUN pip install uwsgi

# Install spacy
RUN pip install spacy==2.0.3

# spacy models
RUN python -m spacy download en_core_web_lg
RUN python -m spacy link en_core_web_lg en --force
# adding home-made german model
RUN pip install https://s3.eu-central-1.amazonaws.com/spacy-int/de_faq-1.0.0.tar.gz
RUN python -m spacy link de_faq de --force
