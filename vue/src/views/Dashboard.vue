<template>
    <PageComponent title="Dashboard">
        <div v-if="loading" class="flex justify-center">Loading...</div>

        <div v-else class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-5 text-gray-700">
            <div class="bg-white shadow-md p-3 text-center flex flex-col order-1 lg:order-2">

            </div>
            <div class="bg-white shadow-md p-3 text-center flex flex-col order-2 lg:order-4">
                
            </div>
            <div class="row-span-2 order-3 lg:order-1 bg-white shadow-md p-4">
                
            </div>
            <div class="row-span-2 order-4 lg:order-3 bg-white shadow-md p-4">
                
            </div>

       </div>
       
    </PageComponent>
</template>

<script setup>
import PageComponent from '../components/PageComponent.vue';
import { computed } from "vue";
import {useStore} from "vuex";

const store = useStore();

const loading = computed(()=> store.state.dashboard.loading);
const data = computed(()=> store.state.dashboard.data);

store.dispatch('getDashboardData');

</script>