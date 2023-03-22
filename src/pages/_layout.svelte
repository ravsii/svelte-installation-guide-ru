<script>
  import NavBar from '../components/NavBar.svelte'
</script>

<div
  class="flex justify-center min-h-screen from-slate-300 to-orange-300 bg-gradient-to-r place-items-center"
>
  <div class="flex flex-col gap-4 m-12 grow">
    <NavBar />
    <div
      class="w-full p-4 bg-white border rounded shadow border-neutral-400 shadow-black/50"
    >
      <slot />
    </div>
  </div>
</div>
