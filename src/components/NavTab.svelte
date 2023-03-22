<script>
  import { url } from '@roxi/routify'

  export let name, path
</script>

<a
  href="{$url(path)}"
  class="px-4 py-2 border-blue-500 hover:border-b-2 hover:text-blue-500 hover:pb-0"
>
  {name}
</a>
