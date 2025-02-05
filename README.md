# Usage

After you pull the image, you can simply use the openai compatible embedding endpoint:

```bash
curl -vvvv -H 'Content-Type: application/json' "http://localhost:11434/v1/embeddings" -d '{
  "input": ["passage: my text 1", "passage: my text 2"],
  "model": "jeffh/intfloat-multilingual-e5-large"
}'
```

Where `model` can also include the tag as necessary (such as `jeffh/intfloat-multilingual-e5-large:f16`)

# Sizes

The following models quantizations are available:

 - f32
 - f16
 - q8_0

## Model Notes

### e5 large / small

You should prefix your text with `query: ` or `passage: ` for queries and document indexing.

### e5 large instruct

You should use the structure for queries:

```
Instruct: {task_description}
Query: {query}
```

Documents do not need any special structure to be embedded for indexing.

# Links

## E5 Large

- [Ollama Modes][1]
- [GitHub Repo][2]
- [Original Model][3]

[1]: https://ollama.com/jeffh/intfloat-multilingual-e5-large
[2]: https://github.com/jeffh/ollama-models
[3]: https://huggingface.co/intfloat/multilingual-e5-large


## E5 Large Instruct

- [Ollama Modes][4]
- [GitHub Repo][5]
- [Original Model][6]

[4]: https://ollama.com/jeffh/intfloat-multilingual-e5-large-instruct
[5]: https://github.com/jeffh/ollama-models
[6]: https://huggingface.co/intfloat/multilingual-e5-large-instruct

