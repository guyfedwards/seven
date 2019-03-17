FROM 'alpine'

RUN apk update && apk install git cmake

RUN git clone --recursive https://github.com/IoLanguage/io.git

RUN cd io && mkdir build && cd build && cmake ..

RUN make && sudo make install

