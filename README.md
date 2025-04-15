Автоматическое развертывание EKS, ArgoCD и Python-приложения с HTTPS через Cloudflare.

📦 Состав
	•	Terraform создает:
	•	VPC, под-сети
	•	EKS кластер
	•	nginx Ingress Controller
	•	ArgoCD и приложение (Python-сервер)
	•	cert-manager выдает HTTPS сертификаты через Let’s Encrypt
	•	Cloudflare управляет DNS

⚙️ Требования
	•	AWS аккаунт
	•	Домен quixly.io подключен к Cloudflare
	•	Terraform
	•	kubectl
	•	Helm
	•	GitHub Actions (по желанию)

🌐 Домен

Убедитесь, что следующие поддомены настроены в Cloudflare:
	•	argocd.quixly.io — указывает на ingress
	•	app.quixly.io — указывает на ingress
