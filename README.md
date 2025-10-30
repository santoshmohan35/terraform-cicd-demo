# 🚀 Terraform + Jenkins CI/CD on AWS

A complete end-to-end **CI/CD pipeline** using **Terraform**, **Jenkins**, and **AWS** — fully automated infrastructure provisioning, continuous integration, and secure delivery workflow.

This project demonstrates how to:

- Provision AWS infrastructure (VPC, EC2, Security Groups) using **Terraform**
- Deploy **Jenkins** on EC2 with NGINX reverse proxy and HTTPS (Let's Encrypt)
- Integrate **GitHub Webhooks** for automated build triggers
- Run Terraform plans and apply from Jenkins pipelines
- Use **Spot Instances** for cost-efficient Jenkins agents (future-ready setup)
- Maintain everything as code (IaC + Pipeline-as-Code)

---

## 🧩 Architecture Overview
