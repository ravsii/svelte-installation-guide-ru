<script>
  let responseJson
  let value

  async function handleSendRequest() {
    const res = await fetch('https://echo.zuplo.io/', {
      method: 'POST', // Метод
      body: JSON.stringify(value), // Тело запроса. Обязательно в виде строки
    })
    const resJson = await res.json()

    // Дополнительные проверки resJson, какая-то логика

    responseJson = resJson
  }
</script>

<div class="flex gap-4">
  <div class="flex flex-col flex-1 gap-4">
    <textarea
      class="p-1 border-2 rounded border-neutral-600"
      rows="8"
      placeholder="Запрос в виде JSON строки"
      bind:value="{value}"></textarea>
    <button
      on:click="{handleSendRequest}"
      class="p-2 transition-all bg-blue-300 border-2 rounded cursor-pointer border-neutral-600 hover:bg-blue-600 hover:text-white"
    >
      Отправить запрос
    </button>
  </div>
  <div
    class="flex justify-center flex-1 p-1 border-2 rounded border-neutral-600 place-items-center basis-0"
  >
    {#if responseJson}
      <pre class="flex w-1 overflow-auto text-xs grow">{JSON.stringify(
          responseJson,
          null,
          '\t'
        )}
			</pre>
    {:else}
      <span class="text-sm opacity-70">
        Отправьте запрос чтобы увидеть ответ
      </span>
    {/if}
  </div>
</div>
