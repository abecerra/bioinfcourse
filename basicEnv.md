# Basic environment installation

1. Go to https://docs.conda.io/en/latest/miniconda.html

2. Select version with Python 3.7 for your operating system and download

3. Install package

4. Search "Anaconda Prompt (miniconda3) on your computer and execute it

5. In this shell window, type "conda" (enter).
From now on Execute "text" means to type the text in a new line in the shell and press enter.

If there is output, now we have an environment to install many tools.

6. Execute "conda config --add channels bioconda". The bioconda channel has bioinformatics packages. Reference: 
https://bioconda.github.io/user/install.html#set-up-channels

7. Execute "conda config --add channels conda-forge". The bioconda channel needs some packages in that chanell

8. Execute "conda install biopython"  and press Y when asked if Proceed 

9. Similarly, Execute "conda install spyder"

10. Now you can search in your operating system menu the application Spyder, a text editor for programming, and launch it. If the app ask to install Kite it is safe to answer yes.

11. In Spyder go to Menu option Help -> Spyder Tutorial. Follow it, at least the "Execute a given program", "What happens when you execute a program?" and "Call existing functions in the Console" sections. It does not matter if you are not understanding everything.

12. In spyder, find the Ipython shell. Execute "import this" in the shell. Enlighten yourself.

13. In spyder create a new file "step0.py", save it in a folder for the course.

12. Type the following and save the program, and fix it if needed:
    def holamundo():
        print("Hola a todo el mundo")
        
13. Execute the program

14. Do the same with new file "step1.py":
    def sqrt(x):
        return x ** 2
    
    for i in range(10):
        print( i, sqrt(i) )
        
        
15. Do not worry if you are not understanding everything or can not execute the programs.
