import subprocess, os

def get_immediate_subdirectories(dir):
    return [name for name in os.listdir(dir)
            if os.path.isdir(os.path.join(dir, name))]
    

current_directory = os.getcwd()
subdirs = get_immediate_subdirectories(current_directory)

fileList = []
pathToCoral = '../src/build/coralc'

def compileTests(subdirs):
    for dir in subdirs:    
        for file in os.listdir(dir):
            if file.endswith('.cl'):
                #print files
                compileFile = dir +'/' + file                
                subprocess.call([pathToCoral, compileFile])
                
def runFiles(subdirs):
    for dir in subdirs:    
        for files in os.listdir(dir):
            if files.endswith('.clx'):
                with open('output', 'w') as outfile:
                    subprocess.call(["python", compileFile], stdout=outfile, stderr=outfile)
                    

            
print fileList
            









