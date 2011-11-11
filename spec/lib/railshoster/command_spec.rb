require File.join(File.dirname(__FILE__), "..", "..", "spec_helper")

describe Railshoster::Command do
  describe "#Basics" do
    it "should instanciate a Command instance also initializing the project git repo" do

      # We use the gem's dir as this should be a valid git repo
      git_dir = File.join(File.dirname(__FILE__), "..", "..", "..")
      expect { c = Railshoster::Command.new(git_dir) }.to_not raise_error(Railshoster::PossiblyNotAGitRepoError)
    end
  
    it "should fail to instanciate a Command for a non-git project dir" do    

      # The spec folder is part of a but not a git repo
      non_git_dir = File.dirname(__FILE__)      
      expect { c = Railshoster::Command.new(non_git_dir) }.to raise_error(Railshoster::PossiblyNotAGitRepoError)
    end
  end
end