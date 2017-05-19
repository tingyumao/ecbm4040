# Deep learning environment setup

## Sign up your google cloud account:

1. Go to 

## Add CUDA into your PATH
CUDA toolkit(8.0) as well as cuDNN(v5.1) has already installed in your instance. To use it, you need to add the location of cuda toolkit into your environment variable.

Open your ~/.bashrc file
```
$ vi ~/.bashrc
```

Then add following content into the end of your ~/.bashrc file. Here is a link on [vi/vim editorvi editor](https://www.cs.colostate.edu/helpdocs/vi.html) 
```
##CUDA toolkit
export PATH="/usr/local/cuda-8.0/bin:$PATH"
export LD_LIBRARY_PATH="/usr/local/cuda-8.0/lib64:$LD_LIBRARY_PATH"
```

Then reinitialize your environment variables.
```
$ source ~/.bashrc
```

Then you can run following code to check if CUDA is avaiable.
```
$ nvcc -V
```

And you will see something like below and the output shows the version of CUDA.
```
nvcc: NVIDIA (R) Cuda compiler driver
Copyright (c) 2005-2016 NVIDIA Corporation
Built on Tue_Jan_10_13:22:03_CST_2017
Cuda compilation tools, release 8.0, V8.0.61
```

Moreover, if you want to know info on the gpu then you can run,
```
$ nvidia-smi
```

And you will see,
```
+-----------------------------------------------------------------------------+
| NVIDIA-SMI 375.26                 Driver Version: 375.26                    |
|-------------------------------+----------------------+----------------------+
| GPU  Name        Persistence-M| Bus-Id        Disp.A | Volatile Uncorr. ECC |
| Fan  Temp  Perf  Pwr:Usage/Cap|         Memory-Usage | GPU-Util  Compute M. |
|===============================+======================+======================|
|   0  Tesla K80           Off  | 0000:00:04.0     Off |                    0 |
| N/A   49C    P0    71W / 149W |      0MiB / 11439MiB |    100%      Default |
+-------------------------------+----------------------+----------------------+
                                                                               
+-----------------------------------------------------------------------------+
| Processes:                                                       GPU Memory |
|  GPU       PID  Type  Process name                               Usage      |
|=============================================================================|
|  No running processes found                                                 |
+-----------------------------------------------------------------------------+
```

## Create gpu instance
1. Go to "Compute Engine" and choose "Images".


2. Create instance based on image "e4040-gpu-image1". Set zone as "us-east1-d". Then choose 1 or 2 "vCPU" and 1 "Nvidia K80 GPU". 

3. Tick "Allow HTTP traffic" and "Allow HTTPS traffic".

4. Click "Create" to create your own instance.

** Here it may request you to fill out a form to increase your GPU quota. 

## Install miniconda and packages
1. Open your instance by SSH.
2. Run the code below to download and install Miniconda.Type "y" or "yes" during installation. For more information on miniconda, please refer to [Miniconda](https://conda.io/docs/intro.html).

    ```{r, engine='bash', count_lines}
    $ wget https://repo.continuum.io/miniconda/Miniconda2-latest-Linux-x86_64.sh
    $ bash Miniconda2-latest-Linux-x86_64.sh
    ```
    Here we choose to install python2 but python3 is also available and you can select it as you like.
    

3. After finishing Miniconda's installation, activate Miniconda and then create your own tensorflow environment.

    ```{r, engine='bash', count_lines}
    $ source ~/.bashrc
    $ conda create -n tensorflow
    ```

4. Install tensorflow-gpu. First activate your conda enironment "tensorflow" and note that every time you want to use tensorflow, you need to first activate this environment. 

    ```{r, engine='bash', count_lines}
    $ source activate tensorflow
    ```

	Then install tensorflow-gpu.

    ```
    (tensorflow)$ pip install --ignore-installed --upgrade \
     https://storage.googleapis.com/tensorflow/linux/gpu/tensorflow_gpu-1.1.0-cp27-none-linux_x86_64.whl
    ```

	Open python to check if tensorflow is installed successfully.

    ```python
    >> import tensorflow as tf
    >> # Creates a graph.
    >> a = tf.constant([1.0, 2.0, 3.0, 4.0, 5.0, 6.0], shape=[2, 3], name='a')
    >> b = tf.constant([1.0, 2.0, 3.0, 4.0, 5.0, 6.0], shape=[3, 2], name='b')
    >> c = tf.matmul(a, b)
    >> # Creates a session with log_device_placement set to True.
    >> sess = tf.Session(config=tf.ConfigProto(log_device_placement=True))
    >> # Runs the op.
    >> print(sess.run(c)) 
	```

    If tensorflow is installed successfully and using gpu as backend, then you will see something like below.

    ```python
    Found device 0 with properties: 
    name: Tesla K80
    major: 3 minor: 7 memoryClockRate (GHz) 0.8235
    pciBusID 0000:00:04.0
    Total memory: 11.17GiB
    Free memory: 11.11GiB
    2017-05-19 01:52:26.255195: I tensorflow/core/common_runtime/gpu/gpu_device.cc:908] DMA: 0 
    2017-05-19 01:52:26.255216: I tensorflow/core/common_runtime/gpu/gpu_device.cc:918] 0:   Y 
    2017-05-19 01:52:26.255229: I tensorflow/core/common_runtime/gpu/gpu_device.cc:977] Creating TensorFlow device (/gpu:0) -> (device: 0, name: Tesla K80, pci bus id: 0000:00:04.0)
    Device mapping:
    /job:localhost/replica:0/task:0/gpu:0 -> device: 0, name: Tesla K80, pci bus id: 0000:00:04.0
    2017-05-19 01:52:26.320382: I tensorflow/core/common_runtime/direct_session.cc:257] Device mapping:
    /job:localhost/replica:0/task:0/gpu:0 -> device: 0, name: Tesla K80, pci bus id: 0000:00:04.0

    MatMul: (MatMul): /job:localhost/replica:0/task:0/gpu:0
    2017-05-19 01:52:40.431855: I tensorflow/core/common_runtime/simple_placer.cc:841] MatMul: (MatMul)/job:localhost/replica:0/task:0/gpu:0
    b: (Const): /job:localhost/replica:0/task:0/gpu:0
    2017-05-19 01:52:40.431913: I tensorflow/core/common_runtime/simple_placer.cc:841] b: (Const)/job:localhost/replica:0/task:0/gpu:0
    a: (Const): /job:localhost/replica:0/task:0/gpu:0
    2017-05-19 01:52:40.431929: I tensorflow/core/common_runtime/simple_placer.cc:841] a: (Const)/job:localhost/replica:0/task:0/gpu:0
    [[ 22.  28.]
     [ 49.  64.]]
    ```

## Use Jupyter
1. [Jupyter](http://jupyter-notebook-beginner-guide.readthedocs.io/en/latest/what_is_jupyter.html) is  a useful server-client application for editing code as well as dispalying results like figure or audio files.

2. Install Jupyter
    ```
    (tensorflow)$ conda install jupyter
    ```

3. Configure your jupyter notebook

	Generate configuration file.
    ```
    (tensorflow)$ jupyter notebook --generate-config
    ```

	Open the config file.
    ```
    (tensorflow)$ vi ~/.jupyter/jupyter_notebook_config.py
    ```

	Then add the following content into config file.
    ```
    c = get_config()
    c.NotebookApp.ip='*'
    c.NotebookApp.open_browser = False
    c.NotebookApp.port =9999      # or other port number
    ```

4. Generate your jupyter login password.

    ```
    (tensorflow)$ jupyter notebook password
    Enter password:  ****
    Verify password: ****
    [NotebookPasswordApp] Wrote hashed password to /Users/you/.jupyter/jupyter_notebook_config.json
    ```

5. Connect your local machine to the google instance.

    First, download and install [google cloud SDK](https://cloud.google.com/sdk/). Then open your Google Cloud SDK console and initialize your gcloud account. Here the information like zone or project id should conform  with your previous setting.

    ```
    gcloud init
    ```

    Then type in following code to set up connection with cloud gpu machine. Note that "-L 9999:localhost:9999", here the first "9999" is your local port and you can set some other port number if you want. The second "9999" is the remote port number and it should be the same as the port that jupyter notebook are running.   
    ```
    gcloud compute ssh --ssh-flag="-L 9999:localhost:9999"  --zone "us-east1-d" "your-instance-name"
    ```

6. Now last step!!! Open your browser and type in http://localhost:9999 or https://localhost:9999 and you will see that it has connected to your gpu instance. Then type in your jupyter password and you can enter into your instance directory. From now on, you have finished all the basic setup for future experiments.
:+1:

## Other packages installation

You may also need some other package other than tensorflow in future and installing methods is as below. You can use either "conda" or "pip" to install and generally, "pip" owns more package resources.

```
(tensorflow)$ conda install "package-name"
```

Or
```
(tensorflow)$ pip install "package-name"
```

Important packages include numpy, scipy, scikit-learn etc. Feel free to add any packages into your tensorflow environment.
