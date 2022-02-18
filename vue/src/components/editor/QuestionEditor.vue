<template>
    <!-- Question index -->
    <div class="flex items-center justify-between">
        <h3 class="text-lg font-bold">
            {{ index + 1 }}. {{ model.question }}
        </h3>

        <div class="flex items-center">
            <!-- Add New Question -->
            <button
                type="button"
                @click="addQuestion()"
                class="flex items-center text-sm py-1 px-4 rounded-sm text-white bg-gray-600 hover:bg-gray-700"
            >
                <svg xmlns="http://www.w3.org/2000/svg" class="h-3 w-3 mr-2 inline-block" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 4v16m8-8H4" />
                </svg>
                Add
            </button>
            <!-- / Add New Questions -->

            <!-- Delete Question -->
            <button
                type="button"
                @click="deleteQuestion()"
                class="flex items-center text-xs py-1 px-4 rounded-sm border border-transparent text-red-500 hover:bg-red-600 hover:text-white"
            >
                <svg xmlns="http://www.w3.org/2000/svg" class="h-3 w-3 mr-2 inline-block" viewBox="0 0 20 20" fill="currentColor">
                    <path fill-rule="evenodd" d="M9 2a1 1 0 00-.894.553L7.382 4H4a1 1 0 000 2v10a2 2 0 002 2h8a2 2 0 002-2V6a1 1 0 100-2h-3.382l-.724-1.447A1 1 0 0011 2H9zM7 8a1 1 0 012 0v6a1 1 0 11-2 0V8zm5-1a1 1 0 00-1 1v6a1 1 0 102 0V8a1 1 0 00-1-1z" clip-rule="evenodd" />
                </svg>
               
                Delete
            </button>
            <!-- / Delete Questions -->
        </div>
    </div>
    <!-- Question index -->
    <div class="grid gap-3 grid-cols-12">
        <!-- question -->
        <div class="mt-3 col-span-9">
            
            <label 
                :for="'question_text_' + model.data" 
                class="block text-sm font-medium text-gray-700">
                Question Text
            </label>
            <input 
                type="text"
                :name="'question_text_' + model.data"
                v-model="model.question"
                @change="dataChange"
                :id="'question_text_' + model.data"
                class="mt-1 focus:ring-indigo-500 focus:border-indigo-500 block w-full shadow-sm sm:text-sm border-gray-300 rounded-md"
            />
        
        </div>
        <!-- question -->

        <!-- question type -->
        <div class="mt-3 col-span-3">
            <label 
                :for="'question_text_' + model.data" 
                class="block text-sm font-medium text-gray-700">
                Select Question Type
            </label>
            <select 
                name="question_type" 
                id="question_type"
                v-model="model.type"
                @change="typeChange"
                class="mt-1 bloc w-full py-2 px-3 border border-gray-300 bg-white rounded-md shadow-sm focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 sm:text-sm"
            >
                <option v-for="type in questionTypes" :key="type" :value="type">
                    {{ upperCaseFirst(type) }}
                </option>

            </select>
            
        </div>
        <!-- question type -->
    </div>
    <!-- Question Description -->
    <div class="mt-3 col-span-9">
        <label 
            :for="'question_description' + model.id " class="block text-sm font-medium text-gray-700">
            Description
        </label>
        <textarea 
            :name="'question_description' + model.id" 
            v-model="model.description"
            @change="dataChange"
            :id="'question_description_' + model.id" 
            rows="10"
            class="mt-1 focus:ring-indigo-500 focus:border-indigo-500 block w-full shadow-sm sm:text-sm border-gray-300 rounded-md"
        >

        </textarea>

    </div>
    <!-- / Question Description -->
   

    <!-- Data -->
    <div>
        <div v-if="shouldHaveOptions()" class="mt-2">
            <h4 class="text-sm font-semibold mb-1 flex justify-between items-center">
                Options

                <button
                    type="button"
                    @click="addOption()"
                    class="flex items-center text-xs py-1 px-2 rounded-sm text-white bg-gray-600 hover:bg-gray-700"
                >
                    <svg xmlns="http://www.w3.org/2000/svg" class="h-3 w-3 mr-2 inline-block" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 4v16m8-8H4" />
                    </svg>
                    Add Option
                </button>
            </h4>
            <div 
                v-if="!model.data.options.length"
                class="text-xs text-gray-600 text-center py-3"
            >
                You don't have any options defined.
            </div>

            <!-- Options list -->
            <div
                v-for="(option, index) in model.data.options"
                :key="option.uuid"
                class="flex items-center mb-1"
            >
                <span class="w-6 text-sm"> {{ index + 1 }}. </span>
                <input 
                    type="text"
                    v-model="option.text"
                    @change="dataChange"
                    class="w-full rounded-sm py-1 px-2 text-xs border border-gray-300 focus:border-indigo-500"
                />
                <!-- Delete option -->
                <button
                    type="button"
                    @click="removeOption(option)"
                    class="h-6 w-6 rounded-full flex items-center justify-center border border-transparent transition-colors hover:border-red-100"
                >
                    <svg xmlns="http://www.w3.org/2000/svg" class="h-3 w-3 text-red-500" viewBox="0 0 20 20" fill="currentColor">
                        <path fill-rule="evenodd" d="M9 2a1 1 0 00-.894.553L7.382 4H4a1 1 0 000 2v10a2 2 0 002 2h8a2 2 0 002-2V6a1 1 0 100-2h-3.382l-.724-1.447A1 1 0 0011 2H9zM7 8a1 1 0 012 0v6a1 1 0 11-2 0V8zm5-1a1 1 0 00-1 1v6a1 1 0 102 0V8a1 1 0 00-1-1z" clip-rule="evenodd" />
                    </svg>
                
                    
                </button>
                <!-- / Delete option -->
            </div>
            <!--/Options list -->
        </div>
    </div>
    <!-- / Data -->

     <hr class="my-4"/>
</template>

<script setup>

    import { ref, computed } from "vue";
    import { v4 as uuidv4 } from "uuid";
    import store from "../../store";

    const props = defineProps({
        question: Object,
        index: Number,
    });

    const emit = defineEmits(["change", "addQuestion", "deleteQuestion"]);

    // Re-create the whole question data to avoid unintentional reference change
    const model = ref(JSON.parse(JSON.stringify(props.question)));


    // Get question types from vuex
    const questionTypes = computed(() => store.state.questionTypes);

    function upperCaseFirst(str) {
        return str.charAt(0).toUpperCase() + str.slice(1);
    }

    function getOptions() {
        return model.value.data.options;
    }

    function setOptions(options) {
        model.value.data.options = options;
    }

    // Check if the question should have options
    function shouldHaveOptions() {
        return ["select", "radio", "checkbox"].includes(model.value.type);
    }

    // Add option
    function addOption() {
        setOptions([
            ...getOptions(),
            { uuid: uuidv4(), text: "" },
        ]);
        dataChange();
    }

    // Remove option
    function removeOption(op) {
        setOptions(getOptions().filter((opt) => opt !== op));
        dataChange();
    }

    function typeChange() {
        if (shouldHaveOptions()) {
            setOptions(getOptions() || []);
        }
        dataChange();
    }

    // Emit the data change
    function dataChange() {
        const data = JSON.parse(JSON.stringify(model.value))
        if (!shouldHaveOptions()) {
            delete data.data.options;
        }
        emit('change', data);
    }

    function addQuestion() {
        emit("addQuestion", props.index + 1);
    }

    function deleteQuestion(question) {
        emit("deleteQuestion", props.question);
    }

</script>

<style>

</style>