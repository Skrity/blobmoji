FROM python:buster
RUN apt update && apt install -y \
    git \
    zopfli \
    libcairo2-dev

# Install nototools
RUN git clone https://github.com/googlefonts/nototools.git /nototools
WORKDIR /nototools
RUN pip install -r requirements.txt
RUN pip install -e .

ADD . /blobmoji
WORKDIR /blobmoji

# Build blobmoji font
CMD make -j $(nproc)
