import {defineConfig} from 'sanity'
import {structureTool} from 'sanity/structure'
import {visionTool} from '@sanity/vision'
import {schemaTypes} from './schemaTypes'

export default defineConfig({
  name: 'default',
  title: 'mark_1',

  projectId: 'racoce49',
  dataset: 'mark_1',

  plugins: [structureTool(), visionTool()],

  schema: {
    types: schemaTypes,
  },
})
