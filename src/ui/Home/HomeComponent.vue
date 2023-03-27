<script setup lang="ts"></script>

<template>
  <div class="home">
    <p>
      Here you would find a Vue bootstrapped webapp where you could start coding
      without taking care about configuring so many things, and just focus on
      the code!
    </p>
    <p>
      This is the home page.
    </p>
  </div>
</template>

<style>
.home {
  align-items: center;
  color: white;
  display: flex;
  flex-direction: column;
  font-size: calc(1rem + 1.5vmin);
  justify-content: center;
  margin: auto;
  max-width: 90vw;
  text-align: center;
}

@media (min-width: 1200px) {
  .home {
    max-width: 60vw;
  }
}
</style>
