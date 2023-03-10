import { Controller } from "@hotwired/stimulus"
import { cameraState } from "map"
import { clippingParents } from "@popperjs/core"

export default class extends Controller {
  static targets = ["smallMap", "modalMap"]
  static values = {
    apiKey: String,
    markers: Array
  }

  connect() {
    mapboxgl.accessToken = this.apiKeyValue
    this.cameraPosition = {}

    this.#mountMap(this.smallMapTarget)
    this.#fitMapToMarkers(this.map)
    this.map.resize();
  }

  mountModalMap() {
    this.#dismountMap()
    this.#mountMap(this.modalMapTarget)
  }

  mountSmallMap() {
    this.#dismountMap()
    this.#mountMap(this.smallMapTarget)
  }

  #mountMap(mapTarget) {
    console.log("shown")
    this.map = new mapboxgl.Map({
      container: mapTarget,
      style: "mapbox://styles/mapbox/streets-v10"
    })
    this.map.setCamera(this.cameraPosition)
    this.#addMarkersToMap(this.map)
  }

  #dismountMap() {
    this.cameraPosition = this.map.cameraState.center
  }

  #addMarkersToMap() {
    this.markersValue.forEach((marker) => {
      new mapboxgl.Marker()
        .setLngLat([marker.lng, marker.lat])
        .addTo(this.map)
    })
  }

  #fitMapToMarkers() {
    const bounds = new mapboxgl.LngLatBounds()
    this.markersValue.forEach(marker => bounds.extend([marker.lng, marker.lat]))
    this.map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 })
  }
}
