import subprocess, os, filecmp,sys

sys.path.append("../backend")

numTests = 0
numCorrect = 0
undefinedExpected = 0

def get_immediate_subdirectories(dir):
    return [name for name in os.listdir(dir)
            if os.path.isdir(os.path.join(dir, name))]
    
def compileTests(subdirs):
    for dir in subdirs:    
        for file in os.listdir(dir):
            if file.endswith('.cl'):
                #print files
                compileFile = dir +'/' + file                
                #subprocess.call([pathToCoral, compileFile])
                
def runFiles(subdirs):
    for dir in subdirs:    
        for file in os.listdir(dir):
            if file.endswith('.clx'):
                fileName = file.split('.')
                with open(dir+'/'+fileName[0]+'.out', 'w') as outfile:
                    subprocess.call(["python", dir+'/'+file], stdout=outfile, stderr=outfile)
                outfile.close()
                    
def compare(subdirs):
    for dir in subdirs:    
        for file in os.listdir(dir):
            if file.endswith('.out'):
                global numTests                
                numTests = numTests + 1            
                fileName = file.split('.')
                expectedFile  = dir + '/' + fileName[0] +'.exp'
                if not os.path.exists(expectedFile):
                    global undefinedExpected
                    undefinedExpected = undefinedExpected + 1
                    print fileName[0] + ' does not have expected file.'
                    continue
                if(True == filecmp.cmp(dir + '/' + file, dir + '/' + fileName[0]+'.exp')):
                    global numCorrect
                    numCorrect = numCorrect + 1
                                


current_directory = os.getcwd()
subdirs = get_immediate_subdirectories(current_directory)

fileList = []
pathToCoral = '../src/build/coralc'
compileTests(subdirs)
runFiles(subdirs)
compare(subdirs)

print 'Correct :' +  str(numCorrect) + ' Total:' + str(numTests)
print 'Failed :' +  str(numTests - numCorrect)                    

            









