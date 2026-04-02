# Software Stack Map — Semiconductor Software Layer Reference

> Reference knowledge base for The King's Hand. Maps each software stack layer
> to its technical scope, failure modes, document-language detection patterns,
> and business value translation.

---

## Overview

| Layer | Technical Scope | Business Value |
|-------|----------------|----------------|
| Bootloader | Hardware init, secure boot, OS loading | Regulatory compliance, security certification |
| BSP & Firmware | Device drivers, DVFS, power management | Battery life, thermal, time-to-market |
| OS / RTOS | Scheduling, context switching, load balancing | App stability, ASIL compliance |
| Middleware | IPC, networking, codec management | Ecosystem stickiness, interoperability |
| SDK & AI Tools | NPU compiler, quantization, APIs | Ecosystem moat, customer integration |

---

## Layer 1: Bootloader (Foundation Layer)

### Technical Scope
Hardware initialization sequence, secure boot chain (TF-A / ARM Trusted Firmware-A, U-Boot, OP-TEE), loading the primary OS or RTOS, establishing the hardware root of trust. In automotive contexts, this includes AUTOSAR MCAL (Microcontroller Abstraction Layer) initialization.

### Key Components
- **TF-A (Trusted Firmware-A):** ARM secure world firmware. Manages EL3 secure monitor, PSCI power state coordination, and secure boot chain verification.
- **U-Boot:** Universal bootloader. Handles DDR initialization, storage device enumeration, device tree loading, and kernel handoff.
- **OP-TEE:** Trusted execution environment for secure operations (DRM key management, secure storage, hardware attestation).
- **AUTOSAR MCAL:** Hardware abstraction for automotive MCUs — GPIO, ADC, SPI, CAN controller initialization.

### Common Failure Modes
| Failure | Consequence | Severity |
|---------|-------------|----------|
| Secure boot chain broken | Cannot pass security certification; product cannot ship to EU market post-CRA | Critical |
| DDR initialization timing failure | System fails to boot on certain memory vendors; limits second-source options | High |
| TF-A/U-Boot handoff race condition | Intermittent boot failure; field return risk | Critical |
| Device tree misconfiguration | Peripheral initialization failures cascade to all higher layers | High |

### Detection Language in Documents
- "Boot time optimization" → likely hiding a cold-boot timing failure or DDR calibration issue
- "Secure boot integration in progress" → root of trust not yet established; all security claims above this layer are invalid
- "Bootloader stabilization" → repeated boot failures not yet root-caused
- "MCAL porting underway" → AUTOSAR hardware abstraction not complete; all driver-level work above is building on sand

### Business Value Translation
**Formula:** Bootloader quality = regulatory market access + supply chain flexibility.
A broken bootloader means: (1) cannot pass EU Cyber Resilience Act certification → locked out of European market, (2) DDR vendor lock-in → cannot second-source during shortage → supply chain vulnerability, (3) field update mechanism compromised → post-sale security patches impossible → product liability exposure.

---

## Layer 2: BSP & Firmware (Hardware Abstraction Layer)

### Technical Scope
The bridge between hardware and OS. Includes Linux/Android kernel device drivers, board support packages, DVFS (Dynamic Voltage and Frequency Scaling) management, thermal management, power state machines (suspend/resume, deep sleep), interrupt controllers, DMA engines, and peripheral interfaces (I2C, SPI, UART, PCIe, USB).

### Key Components
- **Linux/Android BSP:** Kernel configuration, device tree bindings, platform-specific drivers for SoC peripherals.
- **Device Drivers:** GPU, ISP, NPU, display, camera, audio codec, connectivity (Wi-Fi, BT, cellular modem) drivers.
- **Power Management:** DVFS governors, CPU/GPU frequency scaling, deep sleep entry/exit sequences, wake-up source management.
- **Thermal Framework:** Thermal zone definitions, cooling device policies, throttling strategies.

### Common Failure Modes
| Failure | Consequence | Severity |
|---------|-------------|----------|
| DMA race condition masked by spinlock | CPU cycle burn; deep sleep power states destroyed; real-time guarantees broken | Critical |
| DVFS state machine bug | Thermal throttling triggered unnecessarily or not triggered when needed; customer thermal test failure | High |
| Interrupt controller errata workaround | Polling loop replaces interrupt-driven wake-up; power consumption permanently elevated | Critical |
| I2C/SPI timing violation | NOP insertion workaround breaks RTOS task scheduler precision | Medium |
| Suspend/resume sequence failure | Device cannot enter deep sleep; battery life spec unachievable | Critical |

### Detection Language in Documents
- "BSP optimization ongoing" → power or thermal targets not met; could be blocking customer evaluation
- "Driver stability improvements" → repeated crashes or data corruption in a peripheral driver
- "Power management tuning" → cannot achieve target deep sleep current; battery life spec at risk
- "Firmware patch for hardware errata" → hardware bug found; metal spin avoided; PPA cost transferred to software
- "Interrupt handling refinement" → likely replacing interrupt-based logic with polling due to hardware defect

### Business Value Translation
**Formula:** BSP quality = customer time-to-market + product PPA differentiation.
The BSP directly determines: (1) how fast a customer can bring up their product on this SoC → faster BSP = earlier design-win lock-in, (2) battery life and thermal performance → the spec numbers that appear on the customer's product datasheet, (3) stability of the platform for all software above → a buggy BSP means every middleware and application team is debugging hardware issues instead of building features.

---

## Layer 3: OS / RTOS (Execution Environment Layer)

### Technical Scope
Operating system kernel or real-time operating system providing: task scheduling, memory management, context switching, multi-core load balancing, inter-process communication primitives, file systems, and safety-critical execution guarantees.

### Key Components
- **Linux Kernel:** For application processors — scheduler (CFS/EEVDF), memory management, cgroups, namespaces, eBPF.
- **Android Framework:** Activity manager, SurfaceFlinger, Binder IPC, HAL (Hardware Abstraction Layer) interfaces.
- **FreeRTOS / Zephyr:** For microcontrollers and real-time subsystems — deterministic scheduling, minimal footprint, POSIX compatibility layers.
- **AUTOSAR Classic / Adaptive:** For automotive — ASIL-D certified execution environment, deterministic task scheduling, safety monitors.
- **QNX / SafeRTOS:** For safety-critical automotive and industrial applications.

### Common Failure Modes
| Failure | Consequence | Severity |
|---------|-------------|----------|
| Scheduler latency exceeding real-time bounds | ASIL-D certification failure; automotive customer cannot ship | Critical |
| Memory leak in long-running service | System degrades over hours/days; field reliability issue | High |
| Context switch overhead from workaround patches | CPU utilization baseline elevated; performance headroom lost | Medium |
| Multi-core load imbalance | One core saturated while others idle; throughput below spec | High |
| IPC bottleneck between cores | Data pipeline stalls; frame drops in multimedia/ADAS workloads | High |

### Detection Language in Documents
- "Scheduler optimization" → likely real-time deadline misses; RTOS determinism compromised
- "Memory management improvements" → memory leaks or fragmentation under sustained load
- "System stability testing" → crashes under stress conditions not yet resolved
- "ASIL compliance work in progress" → safety certification requirements not yet met; automotive customer gate not passed
- "Multi-core performance tuning" → load balancing broken; expected parallelism not achieved

### Business Value Translation
**Formula:** OS/RTOS quality = application stability + safety certification access + platform credibility.
The OS layer determines: (1) whether the platform can pass ASIL-D certification → gate for all automotive revenue, (2) whether applications run reliably under sustained load → customer product quality, (3) whether the multi-core architecture delivers its promised performance → the benchmark numbers used in marketing and customer pitches.

---

## Layer 4: Middleware (Ecosystem Infrastructure Layer)

### Technical Scope
Software frameworks sitting between OS and application layer: inter-process communication frameworks, networking protocol stacks, multimedia codecs and pipelines, security middleware, and connectivity management.

### Key Components
- **IPC Frameworks:** D-Bus, Binder (Android), SOME/IP (automotive), DDS (robotics/automotive).
- **Networking Stacks:** TCP/IP, Wi-Fi (wpa_supplicant), Bluetooth (BlueZ), cellular modem interface, MQTT (IoT), Matter (smart home).
- **Multimedia:** GStreamer, OpenMAX, camera HAL, video encode/decode pipelines, audio frameworks.
- **Security Middleware:** TLS/SSL libraries, certificate management, secure element interfaces, DRM frameworks.
- **PCIe/USB Subsystems:** High-speed peripheral connectivity, host/device mode management, protocol-level error handling.

### Common Failure Modes
| Failure | Consequence | Severity |
|---------|-------------|----------|
| IPC throughput bottleneck | Data pipeline stalls between hardware accelerators and applications | High |
| Networking stack instability | Connectivity drops; IoT device loses cloud connection; customer escalation | High |
| Codec performance regression | Video playback stutters; benchmark scores drop; competitive comparison lost | Medium |
| PCIe/USB protocol framing error | Header padding workaround reduces throughput; performance regression | Medium |
| Security middleware vulnerability | Potential product recall; regulatory exposure | Critical |

### Detection Language in Documents
- "Integration testing between subsystems" → IPC interfaces not stable; data flow between components broken
- "Connectivity stack stabilization" → Wi-Fi/BT/cellular connection drops or performance issues
- "Multimedia pipeline optimization" → frame drops, decode latency, or quality regression
- "Protocol compliance testing" → USB/PCIe/networking protocol violations; interoperability failures
- "Security audit in progress" → vulnerability discovered; scope and impact not yet determined

### Business Value Translation
**Formula:** Middleware quality = ecosystem stickiness + ISV adoption + switching cost.
Middleware determines: (1) whether third-party software vendors (ISVs) can build on this platform without friction → ecosystem breadth, (2) whether the platform's networking and multimedia capabilities meet customer benchmark expectations → competitive positioning, (3) whether customers face high switching costs once they've integrated → lock-in and recurring revenue protection.

---

## Layer 5: SDK & AI Tools (Ecosystem Moat Layer)

### Technical Scope
Developer-facing tools, compilers, and frameworks that enable customers and third-party developers to build applications on the IC platform. This is where hardware compute capability is monetized and ecosystem moats are built.

### Key Components
- **NPU Compiler Toolchain:** Model compiler (ONNX → hardware-native), graph optimizer, operator library, quantization tools (INT8/INT4), profiling and debugging tools.
- **AI SDK:** High-level inference APIs, model zoo, pre-optimized reference models, deployment tools (edge inference, cloud offload).
- **ISP Pipeline Tools:** Camera tuning tools, 3A (auto-exposure, auto-focus, auto-white-balance) calibration, image quality debugging.
- **GPU SDK:** Graphics driver API (Vulkan, OpenGL ES), compute shaders, GPU profiling tools.
- **Developer Experience:** Documentation, sample code, tutorials, migration guides from competitor platforms, benchmarking tools.

### Common Failure Modes
| Failure | Consequence | Severity |
|---------|-------------|----------|
| NPU compiler generates suboptimal code | Inference TOPS well below silicon capability; benchmark loss to competitors | Critical |
| Model quantization accuracy loss | Customer's AI model degrades when deployed; design-win at risk | High |
| SDK API instability between releases | Customer's integration breaks on update; trust erosion | High |
| Profiling tools inaccurate | Developers cannot optimize; performance tuning becomes guesswork | Medium |
| Documentation gaps | Customer onboarding slowed; FAE escalation volume increases | Medium |

### Detection Language in Documents
- "NPU compiler optimization" → likely TOPS gap between theoretical and actual inference performance
- "Model accuracy tuning" → quantization is degrading model quality beyond acceptable thresholds
- "SDK API finalization" → APIs still changing; customer integration work will need to be redone
- "Developer documentation update" → likely FAE escalations due to unclear or missing docs
- "Benchmark performance investigation" → competitive benchmark comparison unfavorable; marketing claims at risk

### Business Value Translation
**Formula:** SDK/AI Tools quality = ecosystem moat depth + customer lock-in + competitive differentiation.
The SDK layer determines: (1) whether customers choose this platform over Qualcomm/MediaTek/NXP → the AI toolchain is often the deciding factor for edge AI design-wins, (2) whether the hardware compute investment is fully monetized → a powerful NPU with a weak compiler is a stranded asset, (3) whether the developer community grows around this platform → network effects that compound over time, (4) whether customers face prohibitive migration costs once they've trained models and built pipelines on this SDK → long-term revenue protection.
