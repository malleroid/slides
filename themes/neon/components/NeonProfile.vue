<script setup lang="ts">
import { computed } from 'vue'

interface SocialLink {
  platform: 'github' | 'twitter' | 'linkedin' | 'website' | 'email'
  url: string
}

interface Props {
  avatar?: string
  name: string
  title?: string
  bio?: string
  skills?: string[]
  social?: SocialLink[]
  glowColor?: 'cyan' | 'matrix' | 'purple' | 'pink' | 'yellow' | 'orange'
}

const { glowColor = 'cyan' } = defineProps<Props>()

const glowClass = computed(() => {
  return `neon-glow-${glowColor}`
})

const glowBorderClass = computed(() => {
  const colorMap = {
    cyan: 'border-cyan-400 shadow-cyan-400/50',
    matrix: 'border-green-400 shadow-green-400/50',
    purple: 'border-purple-400 shadow-purple-400/50',
    pink: 'border-pink-400 shadow-pink-400/50',
    yellow: 'border-yellow-400 shadow-yellow-400/50',
    orange: 'border-orange-400 shadow-orange-400/50'
  }
  return colorMap[glowColor]
})

function getSocialIcon(platform: string) {
  const icons = {
    github: '🐙',
    twitter: '🐦',
    linkedin: '💼',
    website: '🌐',
    email: '✉️'
  }
  return icons[platform as keyof typeof icons] || '🔗'
}
</script>

<template>
  <div class="neon-profile">
    <div class="profile-card" :class="glowBorderClass">
      <div class="profile-header">
        <div v-if="avatar" class="avatar-wrapper">
          <img :src="avatar" :alt="name" class="avatar-image">
          <div class="avatar-glow" :class="glowBorderClass"></div>
        </div>
        <div v-else class="avatar-placeholder" :class="glowBorderClass">
          {{ name.charAt(0).toUpperCase() }}
        </div>
      </div>
      
      <div class="profile-info">
        <h2 class="profile-name" :class="glowClass">{{ name }}</h2>
        <p v-if="title" class="profile-title">{{ title }}</p>
        <p v-if="bio" class="profile-bio">{{ bio }}</p>
      </div>

      <div v-if="skills && skills.length" class="skills-section">
        <span 
          v-for="(skill, index) in skills"
          :key="`${skill}-${index}`"
          class="skill-tag"
          :class="[glowBorderClass, index % 2 === 0 ? 'flicker' : '']"
        >
          {{ skill }}
        </span>
      </div>

      <div v-if="social && social.length" class="social-section">
        <a
          v-for="(link, linkIndex) in social"
          :key="`${link.platform}-${linkIndex}`"
          :href="link.url"
          target="_blank"
          rel="noopener noreferrer"
          class="social-link"
          :class="glowBorderClass"
        >
          <span class="social-icon">{{ getSocialIcon(link.platform) }}</span>
        </a>
      </div>
    </div>
  </div>
</template>

<style scoped>
.neon-profile {
  display: flex;
  justify-content: center;
  align-items: center;
  height: 100%;
}

.profile-card {
  background: rgba(0, 0, 0, 0.6);
  backdrop-filter: blur(10px);
  border-width: 1px;
  border-style: solid;
  border-radius: 1.5rem;
  padding: 2rem 3rem;
  max-width: 600px;
  width: 100%;
  box-shadow: 0 0 30px var(--un-shadow-color, currentColor);
  transition: all 0.3s ease;
}

.profile-card:hover {
  transform: translateY(-5px);
  box-shadow: 0 0 40px var(--un-shadow-color, currentColor);
}

.profile-header {
  display: flex;
  justify-content: center;
  margin-bottom: 1.25rem;
}

.avatar-wrapper {
  position: relative;
  width: 112px;
  height: 112px;
}

.avatar-image {
  width: 100%;
  height: 100%;
  border-radius: 50%;
  object-fit: cover;
  border-width: 3px;
  border-style: solid;
  box-shadow: 0 0 30px var(--un-shadow-color, currentColor);
}

.avatar-glow {
  position: absolute;
  top: -10px;
  left: -10px;
  right: -10px;
  bottom: -10px;
  border-radius: 50%;
  border-width: 2px;
  border-style: solid;
  opacity: 0.5;
  animation: pulse 2s infinite;
}

.avatar-placeholder {
  width: 112px;
  height: 112px;
  border-radius: 50%;
  display: flex;
  align-items: center;
  justify-content: center;
  font-size: 2.5rem;
  font-weight: bold;
  background: rgba(0, 0, 0, 0.8);
  border-width: 3px;
  border-style: solid;
  box-shadow: 0 0 30px var(--un-shadow-color, currentColor);
  color: #ffffff;
}

@keyframes pulse {
  0%, 100% {
    transform: scale(1);
    opacity: 0.5;
  }
  50% {
    transform: scale(1.05);
    opacity: 0.8;
  }
}

.profile-info {
  text-align: center;
  margin-bottom: 1.25rem;
}

.profile-name {
  font-size: 2rem;
  font-weight: 700;
  margin-bottom: 0.5rem;
  letter-spacing: 2px;
}

.profile-title {
  font-size: 1.2rem;
  color: #aaa;
  margin: 0 0 0.75rem;
}

.profile-bio {
  margin: 0;
  font-size: 1rem;
  color: #ccc;
  line-height: 1.6;
}

.skills-section {
  display: flex;
  flex-wrap: wrap;
  gap: 0.75rem;
  justify-content: center;
  margin-bottom: 1.25rem;
}

.skill-tag {
  padding: 0.5rem 1rem;
  border-radius: 2rem;
  font-size: 0.875rem;
  font-weight: 500;
  background: rgba(0, 0, 0, 0.5);
  border-width: 1px;
  border-style: solid;
  box-shadow: 0 0 10px var(--un-shadow-color, currentColor);
  transition: all 0.3s ease;
}

.skill-tag:hover {
  transform: scale(1.05);
  box-shadow: 0 0 15px var(--un-shadow-color, currentColor);
}

.social-section {
  display: flex;
  gap: 1rem;
  justify-content: center;
}

.social-link {
  display: flex;
  align-items: center;
  justify-content: center;
  width: 50px;
  height: 50px;
  border-radius: 50%;
  background: rgba(0, 0, 0, 0.5);
  border-width: 1px;
  border-style: solid;
  box-shadow: 0 0 15px var(--un-shadow-color, currentColor);
  text-decoration: none;
  transition: all 0.3s ease;
}

.social-link:hover {
  transform: translateY(-3px) scale(1.1);
  box-shadow: 0 0 25px var(--un-shadow-color, currentColor);
}

.social-icon {
  font-size: 1.5rem;
}
</style>