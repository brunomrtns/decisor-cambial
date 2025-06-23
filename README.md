# 🧠 Decisor Cambial

> Sistema de apoio à decisão que utiliza inteligência artificial e dados econômicos para sugerir a melhor forma de guardar dinheiro, com foco em câmbio BRL/USD.

---

## 📌 Objetivo

Este projeto visa ajudar pessoas a decidirem **se devem manter recursos em real ou converter para dólar**, com base em:

- 📈 Análise de cotações e tendência de mercado
- 📰 Leitura e interpretação de notícias econômicas
- 📊 Avaliação probabilística e justificada da decisão

As recomendações são sempre **probabilísticas**, com foco em **transparência, explicações claras e fontes verificáveis**.

---

## ✅ Casos de uso

- 📉 **Dólar em alta + crise política** → sugerir dólar como proteção
- 📈 **Estabilidade no Brasil + queda do dólar** → sugerir manter em real
- 🧭 Rodar manualmente ou de forma automatizada (ex: cronjob)

---

## 🧠 Como funciona

1. **Coleta de dados de mercado**

   - APIs como Yahoo Finance, Alpha Vantage, Banco Central
   - Foco inicial em BRL/USD

2. **Análise de notícias**

   - Coleta de manchetes de fontes como InfoMoney, Reuters, G1
   - Interpretação por IA: classifica o tom e impacto das notícias

3. **Cálculo de pontuação**
   - Regras + inferência de IA para gerar pontuação
   - Recomendação baseada na pontuação total

---

## 🧪 Exemplo de saída

```text
🧠 Recomendação:
Alta chance de desvalorização do real → considerar conversão para dólar (probabilidade: 78%)

📌 Justificativas:
- Dólar subiu 4,3% nos últimos 5 dias (Yahoo Finance)
- Manchete: “Risco fiscal pressiona real” – InfoMoney (2025-06-22)
- Fed sinaliza nova alta de juros – Reuters (2025-06-21)

📰 Fontes:
- https://www.infomoney.com.br/economia/...
- https://www.reuters.com/markets/...
```

---

## ⚙️ Tecnologias utilizadas

- Python 3.10+
- Bibliotecas: `yfinance`, `requests`, `feedparser`, `beautifulsoup4`, `dotenv`
- Modelos de IA via API externa (ver abaixo)

---

## 🤖 APIs de IA suportadas

O sistema usa modelos de linguagem via API para interpretar manchetes e gerar explicações.

| Modelo     | Status        | Gratuito? | Observações                  |
| ---------- | ------------- | --------- | ---------------------------- |
| Gemini     | ✅ Suportado  | Sim       | Requer chave da Google Cloud |
| DeepSeek   | 🔜 Em análise | Sim       | Fase experimental            |
| OpenAI GPT | ✅ Suportado  | Parcial   | Gratuito com limites ou pago |

> 🔒 As chaves das APIs devem ser definidas via `.env`.

---

## 📁 Estrutura do projeto (MVP)

```text
decisor_cambial/
├── main.py                 # ponto de entrada
├── market_data.py          # coleta e análise de cotações
├── news_analyzer.py        # coleta e análise de manchetes
├── decision_engine.py      # cálculo da recomendação final
├── models/                 # modelos ou prompts de IA
├── utils/                  # funções auxiliares
└── .env                    # variáveis de ambiente (NÃO versionar)
```

---

## 🔐 Configuração do `.env`

Crie um arquivo `.env` com o seguinte conteúdo:

```env
# OpenAI
OPENAI_API_KEY=sk-xxxx
OPENAI_API_URL=https://api.openai.com/v1/chat/completions

# Gemini (Google)
GEMINI_API_KEY=your-gemini-key
GEMINI_API_URL=https://generativelanguage.googleapis.com/v1beta/models/gemini-pro:generateContent
```

> ⚠️ **Nunca compartilhe seu arquivo `.env` ou faça commit com ele.**

---

## 📦 Instalação

```bash
git clone https://github.com/seu-usuario/decisor-cambial.git
cd decisor-cambial
python3 -m venv venv
source venv/bin/activate
pip install -r requirements.txt
cp .env.example .env  # edite com suas chaves reais
```

---

## 🛠️ Em desenvolvimento

Funcionalidades futuras:

- Agendamento automático de análises diárias
- Suporte a outras moedas (euro, bitcoin, ouro)
- Painel web ou exportação para Excel/Telegram
