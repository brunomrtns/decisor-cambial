# 🧠 Decisor Cambial

> Sistema de apoio à decisão que utiliza inteligência artificial e dados econômicos para sugerir a melhor forma de guardar dinheiro, com foco em câmbio BRL/USD.

---

## 📌 Objetivo

Este projeto visa ajudar pessoas a decidirem **se devem manter recursos em real ou converter para dólar**, com base em:

- **Análise de cotações e tendência de mercado**
- **Leitura e interpretação de notícias econômicas**
- **Avaliação probabilística e justificada da decisão**

As recomendações são sempre **probabilísticas**, com foco em **transparência, explicação e fontes verificáveis**.

---

## ✅ Casos de uso

- 📉 **Dólar em alta + crise política** → recomendar dólar como proteção
- 📈 **Estabilidade no Brasil + queda do dólar** → recomendar manter em real
- 📊 O sistema pode ser rodado manualmente ou automatizado (cronjob, script, etc.)

---

## 🧠 Como funciona

1. **Coleta de dados de mercado**

   - APIs como Yahoo Finance, Alpha Vantage, etc.
   - Dólar, real, ouro, bitcoin (foco inicial: BRL/USD)

2. **Análise de notícias**

   - Coleta de manchetes de sites como InfoMoney, Reuters, G1
   - Análise de sentimento e contexto usando APIs de IA (ver abaixo)

3. **Cálculo de pontuação**
   - Combinação de tendências, eventos e manchetes
   - Geração de uma **probabilidade estimada** com **justificativas**

---

## 🧪 Exemplos de saída

🧠 Recomendação:
Alta chance de desvalorização do real → considerar conversão para dólar (probabilidade: 78%)

📌 Justificativas:

Dólar subiu 4,3% nos últimos 5 dias (Yahoo Finance)

Manchete: “Risco fiscal pressiona real” – InfoMoney (2025-06-22)

Fed sinaliza nova alta de juros – Reuters (2025-06-21)

📰 Fontes:

- https://www.infomoney.com.br/economia/

- https://www.reuters.com/markets/

---

## ⚙️ Tecnologias utilizadas

- Python 3.10+
- `yfinance`, `requests`, `feedparser`, `beautifulsoup4`
- `dotenv` para gerenciamento de chaves
- Modelos de IA via API externa (ver abaixo)

---

## 🤖 APIs de IA suportadas (para interpretação de notícias)

O sistema utiliza **modelos de linguagem via API** para entender manchetes e gerar explicações.

Você pode usar:

| Modelo     | Status        | Gratuito? | Observações                      |
| ---------- | ------------- | --------- | -------------------------------- |
| Gemini     | ✅ Suportado  | Sim       | Precisa de chave da Google Cloud |
| DeepSeek   | 🔜 Em análise | Sim       | Em fase experimental             |
| OpenAI GPT | ✅ Suportado  | Parcial   | Gratuito com limites ou pago     |

> 🔒 As chaves de API devem ser configuradas no arquivo `.env`.

---

## 📁 Estrutura do projeto (MVP)

decisor_cambial/
├── main.py # ponto de entrada
├── market_data.py # coleta e análise de cotações
├── news_analyzer.py # coleta e análise de manchetes
├── decision_engine.py # cálculo da recomendação final
├── models/ # modelos ou prompts de IA
├── utils/ # funções auxiliares
└── .env # variáveis de ambiente (NÃO versionar)

---

## 🔐 Configuração do `.env`

Crie um arquivo `.env` com o seguinte conteúdo:

```env
OPENAI_API_KEY=sk-xxxx
OPENAI_API_URL=https://api.openai.com/v1/chat/completions

# Ou, para Gemini
GEMINI_API_KEY=your-gemini-key
GEMINI_API_URL=https://generativelanguage.googleapis.com/v1beta/models/gemini-pro:generateContent

⚠️ Não compartilhe seu .env nem faça commit desse arquivo.

## 📦 Instalação

---

git clone https://github.com/seu-usuario/decisor-cambial.git
cd decisor-cambial
python3 -m venv venv
source venv/bin/activate
pip install -r requirements.txt
cp .env.example .env  # edite com suas chaves


## 🛠️ Em desenvolvimento

---

Funcionalidades futuras:

 * Agendamento automático de análises diárias

 * Suporte a outras moedas (euro, bitcoin, ouro)

 * Painel web ou exportação para Excel/Telegram

```
