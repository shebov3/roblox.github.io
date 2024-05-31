export default {
    sitemap: {
      hostname: 'https://shebov3.github.io/roblox.github.io/',
      transformItems: (items) => {
        // add new items or modify/filter existing items
        items.push({
          url: '/extra-page',
          changefreq: 'monthly',
          priority: 0.8
        })
        return items
      }
    },
    base: '/docs/'
  }