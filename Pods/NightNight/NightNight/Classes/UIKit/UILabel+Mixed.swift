//
//  UILabel+Mixed.swift
//  Pods
//
//  Created by Draveness.
//
//  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
//  AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
//  IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
//  DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE
//  FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
//  DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
//  SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
//  CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
//  OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
//  OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
//
//


import Foundation

public extension UILabel {
    
     var mixedTextColor: MixedColor? {
        get { return getMixedColor(&Keys.textColor) }
        set {
            textColor = newValue?.unfold()
            setMixedColor(&Keys.textColor, value: newValue)
        }
    }
    
     var mixedShadowColor: MixedColor? {
        get { return getMixedColor(&Keys.shadowColor) }
        set {
            shadowColor = newValue?.unfold()
            setMixedColor(&Keys.shadowColor, value: newValue)
        }
    }
    
     var mixedHighlightedTextColor: MixedColor? {
        get { return getMixedColor(&Keys.highlightedTextColor) }
        set {
            highlightedTextColor = newValue?.unfold()
            setMixedColor(&Keys.highlightedTextColor, value: newValue)
        }
    }
    

    override func _updateCurrentStatus() {
        super._updateCurrentStatus()
        
        if let mixedTextColor = mixedTextColor {
            textColor = mixedTextColor.unfold()
        }
        
        if let mixedShadowColor = mixedShadowColor {
            shadowColor = mixedShadowColor.unfold()
        }
        
        if let mixedHighlightedTextColor = mixedHighlightedTextColor {
            highlightedTextColor = mixedHighlightedTextColor.unfold()
        }
        
    }
}
