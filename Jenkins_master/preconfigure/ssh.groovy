import jenkins.model.*
import jenkins.plugins.publish_over_ssh.BapSshHostConfiguration
import jenkins.plugins.publish_over_ssh.BapSshCommonConfiguration

def inst = Jenkins.getInstance()
def publish_ssh = inst.getDescriptor('jenkins.plugins.publish_over_ssh.BapSshPublisherPlugin')


def common = new BapSshCommonConfiguration('','','',false)
common.setKeyPath('/var/run/secrets/id_rsa')
publish_ssh.setCommonConfig(common)

/* Serverlist
 The following has to be set.
  name,hostname,username,encryptedPassword,remoteRootDir,port,timeout,overrideKey,keyPath,key,disableExec
*/

def ansible_host = new File("/run/secrets/ansible_host").text.trim()
def hosts = [
	['Ansible',ansible_host,'ubuntu','','/',22,30000,false,'','',false]
]

hosts.each { host->
  def configuration = new BapSshHostConfiguration(host[0],host[1],host[2],host[3],host[4],host[5],host[6],host[7],host[8],host[9],host[10])
  publish_ssh.addHostConfiguration(configuration)
}
