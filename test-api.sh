#!/bin/bash
set -u

OPENROUTER_API_KEY="$(grep '^API_KEY=' .env | cut -d '=' -f2- | tr -d '\r\n')"
if [ -z "$OPENROUTER_API_KEY" ]; then
  echo "❌ Erro: chave da API OpenRouter não encontrada."
  exit 1
fi

PROMPT="${1:-Explique resumidamente o que é câmbio flutuante.}"
echo "🧠 Prompt: $PROMPT"

API_URL="https://openrouter.ai/api/v1/chat/completions"

PRIORITY_MODELS=(
  "deepseek/deepseek-chat-v3-0324:free"
  "mistralai/mistral-small-3.2-24b-instruct:free"
  "openrouter/optimus-alpha"
  "deepseek/deepseek-v3-base:free"
  "nousresearch/deephermes-3-llama-3-8b-preview:free"
  "qwen/qwen2.5-vl-3b-instruct:free"
  "meta-llama/llama-4-scout:free"
  "meta-llama/llama-4-maverick:free"
  "moonshotai/kimi-vl-a3b-thinking:free"
  "nvidia/llama-3.1-nemotron-nano-8b-v1:free"
  "openrouter/quasar-alpha"
  "deepseek/deepseek-r1-zero:free"
  "google/gemini-2.5-pro-exp-03-25:free"
)

for MODEL in "${PRIORITY_MODELS[@]}"; do
  echo -e "\n🚀 Testando modelo: $MODEL"

  JSON=$(jq -n \
    --arg model "$MODEL" \
    --arg prompt "$PROMPT" \
    '{
      model: $model,
      messages: [
        { "role": "system", "content": "Você é um assistente de IA útil." },
        { "role": "user", "content": $prompt }
      ]
    }')

  RESPONSE_FILE=$(mktemp)
  STATUS=$(curl -s -w "%{http_code}" --http1.1 \
    -H "Authorization: Bearer $OPENROUTER_API_KEY" \
    -H "Content-Type: application/json" \
    -H "User-Agent: CLI-Teste/1.0" \
    -H "X-Title: CLI-OpenRouter-Teste" \
    -H "HTTP-Referer: https://localhost" \
    -d "$JSON" \
    -o "$RESPONSE_FILE" \
    "$API_URL")

  if [ "$STATUS" = "200" ]; then
    echo -e "\n✅ Sucesso com modelo: $MODEL"
    echo -e "\n📊 Resposta formatada:"
    jq -r '.choices[0].message.content' <"$RESPONSE_FILE"
    exit 0
  else
    echo "❌ Falha com $MODEL (Status: $STATUS)"
  fi
done

echo -e "\n🚫 Nenhum modelo gratuito funcionou com a chave atual."
exit 2
