FROM ubuntu:latest
RUN apt-get update && apt-get install -y \
    vim \
    sudo \
    wget
RUN wget https://repo.anaconda.com/archive/Anaconda3-2020.11-Linux-x86_64.sh && \
    sh Anaconda3-2020.11-Linux-x86_64.sh -b -p /opt/anaconda3 && \
    rm -f Anaconda3-2020.11-Linux-x86_64.sh
ENV PATH /opt/anaconda3/bin:$PATH
RUN conda install jupyterlab && \
    conda install pytorch torchvision torchaudio cudatoolkit=10.2 -c pytorch

# jupyterlab extention
RUN conda install -y nodejs && \
    jupyter labextension install @jupyterlab/toc

WORKDIR /jupyter_work
CMD ["jupyter", "lab", "--ip=0.0.0.0", "--allow-root", "--LabApp.token=''"]
