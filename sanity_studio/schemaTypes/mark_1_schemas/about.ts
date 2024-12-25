
export default {
  name: 'about',
  title: 'About ME',
  type: 'document',
  fields: [
    {
      name: "firstName",
      type: "string",
      title: "First Name",
      validation: (Rule) => Rule.required().error("First Name is mandatory."),
    },
    {
      name: "secondName",
      type: "string",
      title: "Second Name",
    },
    {
      name: "lastName",
      type: "string",
      title: "Last Name",
    },
    {
      name: "age",
      type: "number",
      title: "Age",
      validation: (Rule) => Rule.min(0).error("Age cannot be negative."),
    },
    {
      name: "dateOfBirth",
      type: "date",
      title: "Date of Birth",
      options: {
        dateFormat: "YYYY-MM-DD",
        calendarTodayLabel: "Today",
      },
    },
    {
      name: "gender",
      type: "string",
      title: "Gender",
      options: {
        list: [
          { title: "Male", value: "male" },
          { title: "Female", value: "female" },
          { title: "Other", value: "other" },
        ],
      },
    },
    {
      name: "nationality",
      type: "string",
      title: "Nationality",
    },
    {
      name: "detailDescription",
      type: "text",
      title: "Detail Description",
      description: "Enter a detailed description.",
    },
    {
      name: "contact",
      type: "array",
      title: "Contact Information",
      of: [
        {
          type: "object",
          title: "Contact",
          fields: [
            {
              name: "contactName",
              type: "string",
              title: "Contact Name",
              validation: (Rule) =>
                Rule.required().error("Contact Name is mandatory."),
            },
            {
              name: "contactDetails",
              type: "string",
              title: "Contact Details",
            },
            {
              name: "contactIcon",
              type: "image",
              title: "Contact Icon",
              options: {
                hotspot: true, // Enables image cropping in the studio
              },
              description: "Upload an icon for this contact method.",
            },
            {
              name: "hasLink",
              type: "boolean",
              title: "Has Link",
            },
            {
              name: "contactLink",
              type: "url",
              title: "Contact Link",
              hidden: ({ parent }) => !parent?.hasLink, // Show only if hasLink is true
            },
          ],
        },
      ],
    },
    {
      name: "shortDescription",
      type: "text",
      title: "Short Description",
      description: "A brief 2-3 line description.",
      validation: (Rule) =>
        Rule.max(300).warning("Short Description should be concise."),
    },
    {
      name: "coverImage",
      type: "image",
      title: "Cover Image",
      options: {
        hotspot: true, // Enables image cropping in the studio
      },
      description: "Upload a cover image for the person.",
    },
    {
      name: "avatarImage",
      type: "image",
      title: "Avatar Image",
      options: {
        hotspot: true, // Enables image cropping in the studio
      },
      description: "Upload an avatar image for the person.",
    },
  ],
};
