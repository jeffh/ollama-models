# Usage

After you pull the image, you can simply use the openai compatible embedding endpoint:

```bash
curl -vvvv -H 'Content-Type: application/json' "http://localhost:11434/v1/embeddings" -d '{
  "input": ["passage: my text 1", "passage: my text 2"],
  "model": "jeffh/intfloat-multilingual-e5-large"
}'
```

Where `model` can also include the tag as necessary (such as `jeffh/intfloat-multilingual-e5-large:f16`)

**NOTE** as per e5-large, you should prefix your text with `query: ` or `passage: ` as appropriate.

# Links

- [Ollama Model][1]
- [GitHub Repo][2]
- [Original Model][3]

[1]: https://ollama.com/jeffh/intfloat-multilingual-e5-large:latest
[2]: https://github.com/jeffh/ollama-models
[3]: https://huggingface.co/intfloat/multilingual-e5-large

