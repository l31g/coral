import subprocess, os, filecmp,sys

sys.path.append("../backend")

numTests = 0
numCorrect = 0
undefinedExpected = 0
totalTests = 15

#Remove old files
try:
  subprocess.call('rm */*.clx');
  subprocess.call('rm */*.out');
except:
  print 'Did not remove any files'

failedTests = []

def get_immediate_subdirectories(dir):
    return [name for name in os.listdir(dir)
            if os.path.isdir(os.path.join(dir, name))]
    
def compileTests(subdirs):
    for dir in subdirs:    
        for file in os.listdir(dir):
            if file.endswith('.cl'):
                #print files
                compileFile = dir +'/' + file                
                print pathToCoral + ' '+  compileFile
                with open(dir+'/'+file+'.err', 'w') as outfile:
                  subprocess.call([pathToCoral, compileFile], stdout=outfile, stderr=outfile)
                outfile.close()
                if not os.path.exists(compileFile+'x'):
                    print 'Output cl failed for compileFile' +  dir+'/'+file
                
def runFiles(subdirs):
    for dir in subdirs:    
        for file in os.listdir(dir):
            if file.endswith('.clx'):
                fileName = file.split('.')
                with open(dir+'/'+fileName[0]+'.out', 'w') as outfile:
                    subprocess.call(["python", dir+'/'+file], stdout=outfile, stderr=outfile)
                outfile.close()
                if not os.path.exists( dir+'/'+fileName[0]+'.out'):
                    print 'Output creation failed for ' +  dir+'/'+fileName[0]
                    
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
                else:
                    global failedTests
                    failedTests.append(dir + '/' + fileName[0])
                                

current_directory = os.getcwd()
subdirs = get_immediate_subdirectories(current_directory)

fileList = []
pathToCoral = '../src/build/coralc'
compileTests(subdirs)
runFiles(subdirs)
compare(subdirs)

print 'Correct :' +  str(numCorrect) + ' Total:' + str(numTests)
print 'Failed :' +  str(numTests - numCorrect)
print failedTests          
          

            









