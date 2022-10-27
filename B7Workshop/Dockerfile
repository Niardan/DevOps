FROM debian as base
RUN apt-get update && apt-get install -y \
  python3 \
  pip \
  libpq-dev \
  python-dev 
RUN pip install psycopg2 flask ConfigParser

FROM scratch
COPY --from=base /lib/x86_64-linux-gnu/libpthread.so.0 /lib/x86_64-linux-gnu/libpthread.so.0
COPY --from=base /lib/x86_64-linux-gnu/libdl.so.2 /lib/x86_64-linux-gnu/libdl.so.2
COPY --from=base /lib/x86_64-linux-gnu/libutil.so.1 /lib/x86_64-linux-gnu/libutil.so.1
COPY --from=base /lib/x86_64-linux-gnu/libm.so.6 /lib/x86_64-linux-gnu/libm.so.6
COPY --from=base /lib/x86_64-linux-gnu/libexpat.so.1 /lib/x86_64-linux-gnu/libexpat.so.1
COPY --from=base /lib/x86_64-linux-gnu/libz.so.1 /lib/x86_64-linux-gnu/libz.so.1
COPY --from=base /lib/x86_64-linux-gnu/libc.so.6 /lib/x86_64-linux-gnu/libc.so.6
COPY --from=base  /lib64/ld-linux-x86-64.so.2  /lib64/ld-linux-x86-64.so.2
COPY --from=base  /usr/lib/x86_64-linux-gnu/  /usr/lib/x86_64-linux-gnu/
COPY --from=base  /lib/x86_64-linux-gnu/libcom_err.so.2  /lib/x86_64-linux-gnu/libcom_err.so.2
COPY --from=base  /lib/x86_64-linux-gnu/libresolv.so.2  /lib/x86_64-linux-gnu/libresolv.so.2
COPY --from=base  /lib/x86_64-linux-gnu/libkeyutils.so.1  /lib/x86_64-linux-gnu/libkeyutils.so.1
COPY --from=base  /lib/x86_64-linux-gnu/libgcc_s.so.1  /lib/x86_64-linux-gnu/libgcc_s.so.1

COPY --from=base  /usr/lib/python3.9  /usr/lib/python3.9
COPY --from=base  /usr/local/lib/python3.9/  /usr/local/lib/python3.9/
COPY --from=base  /usr/bin/python3  /usr/bin/python3
COPY --from=base  /bin/sh  /bin/sh

COPY /srv/app/web.py /srv/app/web.py
COPY /srv/app/web.conf  /srv/app/conf/web.conf

ENTRYPOINT /usr/bin/python3 /srv/app/web.py