import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["smallMap", "modalMap"]
  static values = {
    apiKey: String,
    markers: Array
  }

  connect() {
    mapboxgl.accessToken = this.apiKeyValue

    this.smallMap = this.#mountMap(this.smallMapTarget)
    this.#fitMapToMarkers(this.smallMap)
    this.modalMap = this.#mountMap(this.modalMapTarget)
    this.resizeObserver = new ResizeObserver(() => this.modalMap.resize())
    this.resizeObserver.observe(this.modalMapTarget)
  }

  passPositionToModalMap() {
    this.modalMap.setFreeCameraOptions(this.smallMap.getFreeCameraOptions())
  }

  switchToModalMap() {
    this.resizeObserver.disconnect()
    console.log("disconnected")
  }

  switchToSmallMap() {
    console.log("hidden")
    this.smallMap.setFreeCameraOptions(this.modalMap.getFreeCameraOptions())
  }

  #mountMap(mapTarget) {
    const map = new mapboxgl.Map({
      container: mapTarget,
      style: "mapbox://styles/mapbox/streets-v10"
    })
    this.#addMarkersToMap(map)
    return map
  }

  #addMarkersToMap(map) {
    this.markersValue.forEach((marker) => {
      new mapboxgl.Marker()
        .setLngLat([marker.lng, marker.lat])
        .addTo(map)
    })
  }

  #fitMapToMarkers(map) {
    const bounds = new mapboxgl.LngLatBounds()
    this.markersValue.forEach(marker => bounds.extend([marker.lng, marker.lat]))
    map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 })
  }
}
