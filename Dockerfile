FROM mattolson/base

# Create the user first so it has the same uid/gid as any other user created in a similar fashion
RUN groupadd -r app &&\
    useradd -r -g app -d $HOME -s /sbin/nologin -c 'App user' app &&\
    mkdir -p $HOME

RUN mkdir -p /data &&\
    chown -R app:app /data

VOLUME /data

USER app

CMD ["bash"]
