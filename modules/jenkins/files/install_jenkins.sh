set -euxo pipefail
# ----------------------------------------
# Jenkins Installation Script (for Terraform EC2)
# Ubuntu 22.04 LTS or later
# ----------------------------------------

# Update system packages
apt-get update -y
apt-get upgrade -y

# Install dependencies
apt-get install -y openjdk-17-jdk curl gnupg ca-certificates lsb-release

# Create keyring directory
mkdir -p /usr/share/keyrings

# Add Jenkins repository key (updated official key)
curl -fsSL https://pkg.jenkins.io/debian/jenkins.io-2023.key \
    | tee /usr/share/keyrings/jenkins-keyring.asc > /dev/null

# Add Jenkins apt repository
echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
https://pkg.jenkins.io/debian-stable binary/" \
    | tee /etc/apt/sources.list.d/jenkins.list > /dev/null

# Update and install Jenkins
apt-get update -y
DEBIAN_FRONTEND=noninteractive apt-get install -y jenkins

# Enable and start Jenkins service
systemctl enable jenkins
systemctl start jenkins

# Print service status to cloud-init logs
systemctl status jenkins --no-pager
echo "✅ Jenkins installation completed successfully."