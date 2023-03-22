<script>
  import NavTab from './NavTab.svelte'

  const tabs = [
    {
      name: 'Главная',
      path: '/',
    },
    {
      name: 'Тест',
      path: '/test',
    },
  ]
</script>

<div class="flex gap-4 border-b border-neutral-600">
  {#each tabs as tab}
    <NavTab name="{tab.name}" path="{tab.path}" />
  {/each}
</div>
