# InsightSignal MCP

Claude Desktop extension for querying your private, multi-source verified knowledge graph — companies, people, research reports, and business relationships.

Every data point is checked by 2+ independent sources with confidence scores, citation URLs, and temporal provenance tracking.

— Product page: https://www.insightopus.com/insightsignal

## Install

1. **Get an InsightSignal account.** Sign up at https://signal.insightopus.com.
2. **Generate an API key.** In the consumer portal: Profile → API Keys → Generate. Keys start with `is_`.
3. **Download the latest `.mcpb`** from the [Releases](https://github.com/InsightOpus/insightsignal-mcp/releases) page.
4. **Open Claude Desktop** → Settings → Extensions → **Install Extension** → select the `.mcpb` file.
5. **Paste your API key** when prompted. Done.

The bundle uses Claude Desktop's bundled Node.js runtime — there is nothing to install, configure, or `npm install` on your machine.

## Configuration

The bundle prompts for two values during install:

| Field | Description | Default |
|---|---|---|
| `INSIGHTSIGNAL_API_KEY` | Your API key from the InsightSignal portal | _(required)_ |
| `INSIGHTSIGNAL_API_URL` | InsightSignal MCP endpoint | `https://dgapi.insightopus.com/mcp` |

Most users only need to fill in the API key. The default endpoint is the InsightSignal production API.

## What you can do

After install, Claude has access to 14 tools spanning:

- **Search & filter** — companies and people in your verified knowledge graph by grade, industry, location, status, or disposition
- **Contact intelligence** — emails with deliverability, phones with line-type validation, LinkedIn, BDR-focused readiness grades
- **Research reports** — multi-source research with verdicts, evidence links, and competitive analysis
- **Knowledge graph** — subsidiaries, competitors, partners, and key personnel relationships
- **Compare & analyze** — side-by-side company comparison, portfolio-level statistics, intent scoring, temporal snapshots

Full tool list and descriptions: see [`manifest.json`](./manifest.json).

## Privacy & security

- **Network only.** The bundle makes outbound HTTPS calls to your InsightSignal API endpoint. It does not access your filesystem, run shell commands, or modify anything on your computer.
- **Your data stays yours.** All queries operate against your private InsightSignal account. The MCP server is a thin proxy — Anthropic and Claude never see your raw data unless you choose to share specific responses in the chat.
- **Open source client.** The Node.js stub in [`server/index.js`](./server/index.js) is the entire client. ~280 lines. Audit it before installing if you want.

Privacy policy: https://www.insightopus.com/legal/privacy

## Build from source

```bash
bash build.sh
```

Produces `insightsignal.mcpb` in the current directory. Drag it into Claude Desktop to install your local build.

The build is a plain ZIP of three files: `manifest.json`, `server/index.js`, `icon.png`. No compilation, no dependencies.

## Support

- Documentation & support: https://www.insightopus.com/support
- Issues: [GitHub Issues](https://github.com/InsightOpus/insightsignal-mcp/issues)
- Product website: https://www.insightopus.com/insightsignal

## License

MIT — see [LICENSE](./LICENSE).
