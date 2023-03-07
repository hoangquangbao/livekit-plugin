# livekit-plugin

Implement video call in the hybrid app

## Install

```bash
npm install livekit-plugin
npx cap sync
```

## API

<docgen-index>

* [`echo(...)`](#echo)
* [`launchLivekit(...)`](#launchlivekit)

</docgen-index>

<docgen-api>
<!--Update the source file JSDoc comments and rerun docgen to update the docs below-->

### echo(...)

```typescript
echo(options: { value: string; }) => Promise<{ value: string; }>
```

| Param         | Type                            |
| ------------- | ------------------------------- |
| **`options`** | <code>{ value: string; }</code> |

**Returns:** <code>Promise&lt;{ value: string; }&gt;</code>

--------------------


### launchLivekit(...)

```typescript
launchLivekit(options: { token: string; }) => Promise<void>
```

| Param         | Type                            |
| ------------- | ------------------------------- |
| **`options`** | <code>{ token: string; }</code> |

--------------------

</docgen-api>
